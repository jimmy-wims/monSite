<?php
	namespace App\Form\Type;

	use Symfony\Component\Form\AbstractType;
	use Symfony\Component\Form\Extension\Core\Type\TextType;
	use Symfony\Component\Form\Extension\Core\Type\TextareaType;
	use Symfony\Bridge\Doctrine\Form\Type\EntityType;
	use Symfony\Component\Form\Extension\Core\Type\FileType;
	use Symfony\Component\Form\FormBuilderInterface;
	use Symfony\Component\OptionsResolver\OptionsResolver;
	use App\Entity\Projet;
	use App\Entity\Langage;
	use App\Repository\LangageRepository;

	class ProjetType extends AbstractType {
		public function buildForm(FormBuilderInterface $builder, array $options) {
			$builder->add('nom', TextType::class)
			->add('description', TextareaType::class)
			->add('lien', TextType::class)
			->add('langage', EntityType::class,
			 	array('class' => Langage::class,
			 	'query_builder' => function (LangageRepository $repo) {
			 		return $repo->createQueryBuilder('l')
			 			->orderBy('l.nom'); }
 			))
 			->add('image', TextType::class);

		}

		public function configureOptions(OptionsResolver $resolver) {
			$resolver->setDefaults(array( 'data_class' => Projet::class,));
		}
	}