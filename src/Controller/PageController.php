<?php

namespace App\Controller; 

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Request;
use App\Form\Type\ProjetType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use App\Entity\Projet;
use App\Entity\Langage;

class PageController extends AbstractController
{
    public function index()
    {
        return $this->render('accueil/index.html.twig');
    }

    public function navigation() {
        return $this->render('navigation.html.twig');
    }

    public function competence() {
        return $this->render('competence.html.twig');
    }

    public function parcours() {
        return $this->render('parcours.html.twig');
    }

    public function projet($id) {
        $langages = $this->getDoctrine()->getRepository(Langage::class)->findAll();
        if($id == 0) {
            $projets = $this->getDoctrine()->getRepository(Projet::class)->findAll();
            return $this->render('projet.html.twig',array('projets' => $projets, 'affichage' => $id, "langages" => $langages));
        } else {
            $langage = $this->getDoctrine()->getRepository(Langage::class)->find($id);
            $projets = $this->getDoctrine()->getRepository(Projet::class)->findByLangageId($langage);
            return $this->render('projet.html.twig',array('projets' => $projets, 'affichage' => $id, "langages" => $langages));
        }
    }

    public function ajouterProjet(Request $request) {
        $projet = new Projet;
        $form = $this->createForm(ProjetType::class, $projet,
            ['action' => $this->generateUrl('projet_ajouter')]);
            $form->add('submit', SubmitType::class,
            array('label' => 'Ajouter'));
        $form->handleRequest($request);
        if ($form->isSubmitted()) {
            return $this->redirectToRoute('projet',
            array('id' => 0));
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($projet);
            $entityManager->flush();
            return $this->redirectToRoute('projet',
            array('id' => 0));
        }
        return $this->render('projet/ajouter.html.twig',array('monFormulaire' => $form->createView()));
    }

    public function ajouterLangage(Request $request)
    {
        $langage = new Langage;
        $form = $this->createFormBuilder($langage)
        ->add('nom', TextType::class)
        ->add('ajouter', SubmitType::class)
        ->getForm();
        $form->handleRequest($request);
        if ($form->isSubmitted()) {
            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($langage);
            $entityManager->flush();
            return $this->redirectToRoute('listeLangage');
        }
        return $this->render('langage/ajouter.html.twig',
        array('monFormulaire' => $form->createView()));
    }

    public function listeLangage() {
       $langages = $this->getDoctrine()->getRepository(Langage::class)->findAll();
        return $this->render('langage/liste.html.twig',array('langages' => $langages));
    }
}
